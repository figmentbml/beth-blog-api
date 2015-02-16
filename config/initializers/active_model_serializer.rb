# ANGULAR=true rails s

unless ENV['ANGULAR']
  ActiveModel::Serializer.setup do |config|
    config.embed = :ids
    config.embed_in_root = true
  end
end
