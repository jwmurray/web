require 'rubygems'
require 'oauth2'
require 'clio_client'
require 'date'

class ClientsController < ApplicationController
  def index
    access = Access.last;


    client = ClioClient::Session.new({client_id: access.client_id, 
                                      client_secret: access.client_secret,
                                     client_url: access.client_callback_url});

    client.access_token = access.token;

    @me = client.users.who_am_i
    logger.info "Token reused for #{@me[1].first_name} #{@me[1].last_name} of #{@me[0].name}"
    

    @contacts  = client.contacts.list(type: 'Person');
    

    updatedNames = [
"Jenny Ertmann",
"Joanna B Sagers",
"Michelle Blomquist",
"Paul B. Parker",
"Michael Reason",
"Felicia Haycock",
"Jason Crownover",
"Michael Forsberg",
"Julie Winkler",
"Catherine S. Conklin",
"Kathryn Scott",
"Thomas L. Kay",
"Ryan Haycock",
"John W. Murray",
"Jefferson Bagby",
"Gary White",
"Annie Allred",
"Sunny McIntosh"];
    
    logger.info "contact:  " + @contacts[1].to_s;
    logger.info "contact.inspect(): " + @contacts[1].inspect();
    logger.info "contact.name: " + @contacts[1].name;

    @contacts.count.times do |i| 
#    2.times do |i|
      logger.info "contact[#{i}]: " + @contacts[i].name + " phone: " + 
        @contacts[i].phone_numbers.first.to_s;
      
      contact = Contact.where(name: @contacts[i].name).first;


      if contact == nil 
        logger.info "answer: nil";
        contact = Contact.new;
        else
        contact.name = @contacts[i].name;
        contact.save;
      end

      if(contact.last_name != @contacts[i].last_name ||
         contact.first_name != @contacts[i].first_name)

        contact.last_name = @contacts[i].last_name;
        contact.first_name = @contacts[i].first_name;
        contact.save;
      end
      logger.info "answer: #{contact.name}";

 #     @contacts[i].name = updatedNames[i];

 #     full_name = updatedNames[i];
 #     name = full_name.split(' ');

      
 #     first_name = name[0];
 #     (name.count - 2).times do |i|
 #       first_name += " " + name[i+1];
 #       end
      
 #     @contacts[i].first_name = first_name;
 #     @contacts[i].last_name = name.last;
#      @contacts[i].save
      
#      logger.info "contact[#{i}]: " + @contacts[i].name + " phone: " + @contacts[i].phone_numbers.to_s;
#        logger.info "contact.inspect(): " + @contacts[i].inspect();
      if 3 == 5
        contact.first_name = 'Gary ' + Time.now.strftime("%d/%m/%Y %H:%M");
        contact.save;
        logger.info "contact: " + contact.name + " phone: " + contact.phone_numbers.to_s;
        logger.info "contact.inspect(): " + contact.inspect();
      end
    end
  end
end
