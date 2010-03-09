module Dcmgr
  module Models
    class User < Sequel::Model
      include Base
      def self.prefix_uuid; 'U'; end

      many_to_many :accounts
      many_to_many :tags, :join_table=>:tag_mappings, :left_key=>:target_id, :conditions=>{:target_type=>TagMapping::TYPE_USER}
      one_to_many :key_pairs
      
      def validate
        errors.add(:name, "can't empty") unless self.name and self.name.length > 0
        errors.add(:password, "can't empty") unless self.password and self.password.length > 0
      end
      
      def before_create
        super
        self.default_password = self.password
      end
      
      def self.enable_users
        filter(:enable=>true)
      end
    end
  end
end