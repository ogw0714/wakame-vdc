# -*- coding: utf-8 -*-

require 'rubygems'
require File.dirname(__FILE__) + '/../spec_helper'

describe "tags access by active resource" do
  include ActiveResourceHelperMethods
  before(:all) do
    reset_db
    @name_class = describe_activeresource_model :NameTag
    @auth_class = describe_activeresource_model :AuthTag
    
    @account_class = describe_activeresource_model :Account
    @account = @account_class.create(:name=>'test account by instance spec')
  end

  it "should add name tag" do
    tag = @name_class.create(:name=>'name tag #1', :account=>@account.id)
    tag.id.length.should > 0

    real_tag = Tag[tag.id]
    real_tag.should be_valid
    real_tag.account.uuid.should == @account.id
    real_tag.tag_type.should == Tag::TYPE_NORMAL
    real_tag.name.should == 'name tag #1'
    
    $tag = tag
  end
  
  it "should delete name tag" do
    id = $tag.id
    $tag.destroy
    Tag[id].should be_nil
  end
  
  it "should add simple auth tag" do
    tag = @auth_class.create(:name=>'instance crud tag #1',
                             :role=>0,
                             :tags=>[],
                             :account=>@account.id)
    tag.id.length.should > 0

    real_tag = Tag[tag.id]
    real_tag.should be_valid
    real_tag.account.uuid.should == @account.id
    real_tag.tag_type.should == Tag::TYPE_AUTH
    real_tag.name.should == 'instance crud tag #1'
    real_tag.tag_mappings.length.should == 0
    
    $auth_tag = tag
  end
  
  it "should delete auth tag" do
    $auth_tag.destroy
    Tag[$auth_tag.id].should be_nil
  end
  
  
  it "should add auth tag that includes name tags" do
    tag1 = @name_class.create(:name=>'name tag #2-1', :account=>@account.id)
    tag2 = @name_class.create(:name=>'name tag #2-2', :account=>@account.id)
    tag3 = @name_class.create(:name=>'name tag #2-3', :account=>@account.id)
    
    tag = @auth_class.create(:name=>'instance crud tag #2',
                             :role=>1,
                             :tags=>[tag1.id, tag2.id, tag3.id],
                             :account=>@account.id)
    tag.id.length.should > 0

    real_tag = Tag[tag.id]
    real_tag.should be_valid
    real_tag.account.uuid.should == @account.id
    real_tag.role.should == 1
    real_tag.tag_type.should == Tag::TYPE_AUTH
    real_tag.name.should == 'instance crud tag #2'
    real_tag.tag_mappings.length.should == 3
  end
end
