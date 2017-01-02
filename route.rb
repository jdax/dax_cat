require 'sinatra'
require 'aws-sdk-v1'

def aws_params
  {
      :access_key_id => ENV["ACCESS_KEY_ID"],
      :secret_access_key => ENV["SECRET_ACCESS_KEY"]
  }
end

AWS.config(aws_params)

class CatPictureDownloader
  attr_reader :s3

  def initialize(aws_keys)
    @s3 = AWS::S3.new(aws_keys)
  end

  def cat_pic_bucket
    s3.buckets['nikkiscatphotos']
  end

  def random_cat_pic
    cat_pic_bucket.objects.to_a.sample
  end

end

get '/' do
  @cpd = CatPictureDownloader.new(aws_params)
  @key1 = @cpd.random_cat_pic.key
  @key2 = @cpd.random_cat_pic.key
  @key3 = @cpd.random_cat_pic.key
  @key4 = @cpd.random_cat_pic.key
  @key5 = @cpd.random_cat_pic.key
  @key6 = @cpd.random_cat_pic.key
  @key7 = @cpd.random_cat_pic.key
  @key8 = @cpd.random_cat_pic.key
  @key9 = @cpd.random_cat_pic.key
  erb :index
end

