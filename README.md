EC2-Tool
========

EC2 Tool is a simple ruby script to start, stop and check the status of an
Amazon Web Services EC2 Instance.

# Installation
    git clone https://github.com/ajbonner/ec2tool.git
    cd ec2tool
    bundle install
    gem build ec2tool.gemspec
    gem install ec2tool-0.0.1.gem

On first run, the gem will create a $HOME/.ec2tool directory and copy into it
a config.yaml file. In this file, enter in your AWS account access key 
and secret. For details on how to find these credentials see the [Ruby SDK
documentation](http://aws.amazon.com/articles/SDKs/Ruby/8621639827664165).

In the _instances_ section below your access credentials, you can define 
instances with an alias name. Then run ec2tool <alias> to use the tool.

# Contact
This was a small ruby exercise for me, if you spot any glaring issues, or 
if you find this utility helpful please, let me know!

[ajbonner @ Twitter](http://twitter.com/ajbonner), [/Dev/Notes @ Tumblr](http://aaronbonner.tumblr.com)
