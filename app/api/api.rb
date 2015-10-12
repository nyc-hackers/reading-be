require 'email_link_resource'

class API < Grape::API
    prefix "api"
    version "v1", using: :path
    format :json
    mount Listicle::EmailLinkResource
end