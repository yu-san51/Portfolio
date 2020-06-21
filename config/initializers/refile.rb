require "refile/s3"


Refile.cache = Refile::S3.new(prefix: "cache")
Refile.store = Refile::S3.new(prefix: "store")