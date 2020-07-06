require "refile/s3"

if Rails.env.production?
	aws = {
	  region: "ap-northeast-1",
	  bucket: "pf-infra",
	}
	Refile.cache = Refile::S3.new(prefix: "cache", **aws)
	Refile.store = Refile::S3.new(prefix: "store", **aws)
end