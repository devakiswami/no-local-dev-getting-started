# app.rb

require 'sinatra'
require 'sinatra/activerecord'
require './environments'


get "/" do
  erb :home
end


class Contact < ActiveRecord::Base
  self.table_name = 'salesforce.contact'
end

get "/contacts" do
  @contacts = Contact.where(email: 'sean@edge.com')
  erb :index
end

get "/updateContact" do
  @con = Contact.where(email: 'sean@edge.com')
  con.update(email: 'devakinandan@gmail.com')  
end

get "/createContact" do
  Contact = Contact.new do |con|
  con.firstname = "David"
  con.lastname = "mash"
  con.email= "david.mash@gmail.com"
 end
end

get "/create" do
  dashboard_url = 'https://dashboard.heroku.com/'
  match = /(.*?)\.herokuapp\.com/.match(request.host)
  dashboard_url << "apps/#{match[1]}/resources" if match && match[1]
  redirect to(dashboard_url)
end
