class CvSerializer
  include JSONAPI::Serializer
  attributes :id

  attributes :abbr_name, &:abbr_name

  attributes :subdomain, &:subdomain
end
