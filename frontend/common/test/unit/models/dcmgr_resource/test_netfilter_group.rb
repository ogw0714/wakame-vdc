require 'rubygems'
require 'test/unit'
require 'active_resource'

require File.expand_path('../../../../lib/models/dcmgr_resource/base')
require File.expand_path('../../../../lib/models/dcmgr_resource/netfilter_group')

module Frontend
  class TestNetfilterGroup < Test::Unit::TestCase
    def setup
      @netfilter_group = Frontend::Models::DcmgrResource::NetfilterGroup
    end

    def teardown
    end
    
    def test_create
      params = {
        :name => 'groupA',
        :description => 'test',
        :rule => '\ntcp:22,22,0.0.0.0\ntcp:80,80,0.0.0.0\n#tcp:443,443,0.0.0.0\nudp:53,53,0.0.0.0\nicmp:-1,-1,0.0.0.0\n'
      }
      p @netfilter_group.create(params)
      
    end
    
    def test_list
      params = {
        :start => 1,
        :limit => 10
      }
      p @netfilter_group.list(params)
    end
    
    def test_show
      name = 'group'
      p @netfilter_group.show(name)
    end
    
    def test_update
      name = 'group'
      params = {
        :name => 'groupA',
        :description => 'test',
        :rule => '\ntcp:22,22,0.0.0.0\ntcp:80,80,0.0.0.0\n#tcp:443,443,0.0.0.0\nudp:53,53,0.0.0.0\nicmp:-1,-1,0.0.0.0\n'
      }
      p @netfilter_group.update(name,params)
    end
    
    def test_destroy
      p @netfilter_group.destroy(name)
    end
  end
end