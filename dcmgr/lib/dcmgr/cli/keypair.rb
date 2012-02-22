# -*- coding: utf-8 -*-

module Dcmgr::Cli
  class KeyPair < Base
    namespace :keypair
    M = Dcmgr::Models

    desc "add [options]", "Register a new key pair."
    method_option :uuid, :type => :string, :desc => "The UUID for the new key pair"
    method_option :account_id, :type => :string, :desc => "The UUID of the account this key pair belongs to", :required => true
    method_option :public_key, :type => :string, :desc => "The path to the public key", :required => true
    method_option :private_key, :type => :string, :desc => "The path to the private key"
    method_option :description, :type => :string, :desc => "Description for this key pair"
    def add
      UnknownUUIDError.raise(options[:account_id]) if M::Account[options[:account_id]].nil?
      private_key_path = File.expand_path(options[:private_key]) if options[:private_key]
      public_key_path = File.expand_path(options[:public_key])
      
      # Check if the files exist
      Error.raise "Private key file doesn't exist",100 if options[:private_key] && (not File.exists?(private_key_path))
      Error.raise "Public key file doesn't exist",100 unless File.exists?(public_key_path)
      
      # Check if the public key file really is a public key
      system "ssh-keygen -l -f #{options[:public_key]} >> /dev/null"
      Error.raise "#{options[:public_key]} is not a public key file.",100 unless $? == 0
      
      fields = options.dup
      
      #Get the keys from their respective files.
      fields[:public_key] = File.open(public_key_path) {|f| f.readline}
      fields[:private_key] = File.open(private_key_path) {|f| f.readlines.join('') } if options[:private_key]
      
      # If a private key is supplied, verify that it matches the supplied public key
      if options[:private_key]
        begin
          generated_public_key = sh("ssh-keygen -yf #{options[:private_key]}")[:stdout].chomp
        rescue
          Error.raise "Couldn't generate the public key from the private key. Are you sure it is a private key with proper permissions?", 100
        end
        
        unless fields[:public_key].split(' ')[0] == generated_public_key.split(' ')[0] && fields[:public_key].split(' ')[1] == generated_public_key.split(' ')[1]
          Error.raise "The public key doesn't match the private key", 100
        end
      end
      
      #Generate the fingerprint from the public key file
      res = `ssh-keygen -lf #{options[:public_key]}`
      fields[:finger_print] = res.split(' ')[1]
      
      puts super(M::SshKeyPair,fields)
    end
    
    desc "modify UUID [options]", "Modify an existing key pair"
    method_option :account_id, :type => :string, :desc => "The UUID of the account this key pair belongs to"
    method_option :description, :type => :string, :desc => "Description for this key pair"
    def modify(uuid)
      UnknownUUIDError.raise(options[:account_id]) if options[:account_id] && M::Account[options[:account_id]].nil?
      super(M::SshKeyPair,uuid,options)
    end
    
    desc "del UUID", "Delete an existing keypair"
    def del(uuid)
      super(M::SshKeyPair,uuid)
    end
    
    desc "show [UUID] [options]", "Show network(s)"
    def show(uuid=nil)
      if uuid
        keypair = M::SshKeyPair[uuid] || UnknownUUIDError.raise(uuid)
        puts ERB.new(<<__END, nil, '-').result(binding)
Keypair UUID:
  <%= keypair.canonical_uuid %>
Account id:
  <%= keypair.account_id %>
Finger print:
  <%= keypair.finger_print %>
Public Key:
  <%= keypair.public_key%>
<%- if keypair.description -%>
Description:
  <%= keypair.description %>
<%- end -%>
__END
      else
        puts ERB.new(<<__END, nil, '-').result(binding)
<%- M::SshKeyPair.each { |row| -%>
<%= row.canonical_uuid %>\t<%= row.account_id %>\t<%= row.finger_print %>
<%- } -%>
__END
      end
    end
    
  end
end
