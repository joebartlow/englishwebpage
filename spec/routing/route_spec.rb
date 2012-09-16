require 'spec_helper'

describe 'routing' do
  it 'should have a base' do
   {:post => '/bases'}.should route_to(:controller => "bases", :action => "create")
   {:get => '/bases'}.should route_to(:controller => "bases", :action => "index")
   {:get => '/bases/id'}.should route_to(:controller => "bases", :action => "show", :id => 'id')
  end
end