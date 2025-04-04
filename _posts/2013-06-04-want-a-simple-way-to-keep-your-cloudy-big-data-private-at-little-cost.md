---
layout: post
title: Lazy AWS devops
date: 2013-06-04
categories: ["DevOps", "agile SA", "cloud security tools", "automation in IT", "AWS EC2", "orchestration tools", "configuration management", "Chef", "Puppet", "BCFG2", "Capistrano", "Mcollective", "data center management", "infrastructure as a service", "disaster recovery", "system monitoring"]
excerpt: I am seeing too much echo chamber, saber rattling, foolish dogma about agile SA
---
I am seeing too much echo chamber, saber rattling, foolish dogma about agile
SA / devops. “Just use <insert configuration tool name here.>  All of your
problems will be solved.” Yeah, right. And Unicorns talk to virgins. DevOps
setup isn’t simple. One will need to think about a different paradigm. As a
result, one’s mindset will change.  For better and worse, one will slowly
morph into the Bastard Operator from Hell.

Scenario time: a tornado takes out your data center. Or if you were at Google
last year, aliens land and take over the United States. You are at the
symphony. Don’t worry! Good thing you have an AWS EC2 account ready to bring
up Production DR and IT-based BC.

  * • Send an email to [godmode@securesql.info](mailto:godmode@securesql.info) with the subject: thundercats go!
  * • The Bootstrapping automation provisions new instances.
  * • Configuration takes over and ensures the instances are compliant with the golden standards and application settings.
  * • At the same time, Configuration updates Monitoring and Orchestration.
  * • Monitoring works with Orchestration to start services and ensure the system is operating as designed. If additional machines are needed, Bootstrapping brings up additional systems.
  * • When the load decreases, Monitoring works with Orchestration to terminate instances.

All accomplished without a touch of the keyboard or service.  Back to wrapping
your arm around your date @ the symphony.  

If you want to read more about each layer, continue reading… If not, go
outside and enjoy a beer.

The first layer is bootstrapping. Traditional practice, one would file a
ticket with the DC techs to rack the new machine. The DC techs would rack,
cable, and power on the asset. The machine would PXE boot to grab the image to
the system via ftp and / or tftp. Such a pain. This procedure would take 2-3
hours for each machine. One could get 20-30 machines up in parallel. Maybe
much less if one could get the systems pre-imaged from the hardware vendor.
Too much time and effort wasted. With newer SA methods, boot strapping can be
accomplished in less than 5 minutes. Pick one’s infrastructure as a service.
Scalr, GoGrid, AWS EC2, Rackspace Cloud, OpenQRM, and Engine Yard come to
mind. Grab ruby’s fog gem or the vendor’s toolkit. If you are feeling sassy,
utilize a build system such as Jenkins, or Buildbot. Grab your api keys from
your IaaS vendor. Place the credentials in the toolkit. Then put the
automation script in the build system or run it from command line. The script
below would utilize Fog for EC2 to bootstrap a pre-configured, low powered,
logical machine.

> #!/usr/bin/ruby
>
> require 'rubygems'
>
> require 'fog'
>
> require './secrets.rb'
>
> cloud =
> Fog::AWS::EC2.new(:aws_access_key_id=>@aws_access_key_id,:aws_secret_access_key=>@aws_secret_access_key
> )
>
> server = cloud.servers.create(:image_id => 'ami-323', :flavor_id =>
> 'm1.small')
>
> puts "Private IP: #{server.private_ip_address}"
>
> puts "Public IP: #{server.ip_address}"

Nifty, now you have a machine running. But you have to take it your methods to
the next level and configure it to the tasked assigned to you. You can login
to the machine, manually configure packages, settings, and test the system for
assurance and compliance. If you are lucky, you would have written script
automation to handle this for you. Most likely, you haven’t nor would you
periodically run those scripts the machine. Over time, everything will not
look the same. As the number of systems increase, it becomes harder to manage.
Utilizing configuration tools such as Chef, Puppet, CFEngine, or BCFG2, one
can ask the machines “AM I like the standard image?” When they do not, and
they will, the tool will alert and automatically correct the issue. It is a
manageable problem. Completely hands-off. Now I wouldn’t go so far to say this
tool automation solves your needs. You will have Three Mile Island cascading
failures.  

Congrats, one has their application running on their logical asset. But wait,
Product needs to reconfigure the application service to fix a bug. Many will
blindly apply the change across all systems in a rolling fashion.
Orchestration by blind faith is great, but will fall short. Capistrano,
Mcollective, ControlTier, or IronFan are great tools to use in this effect.
Not everyone can acquire Yahoo’s Limo. Orchestrate the organization’s
processes and procedures into a frankenstein tool. For instance, when I bring
a new Cassandra node online, I use the following code:

> announce(:cassandra, :server, :compliance)
>
> neighbors = discover_all(:cassandra, :server, :compliance).map(&:private_ip)
>
> nodes = <%= neighbors.join(',') %>

Configure monitoring to know the good state and health of the service(s.) Then
have monitoring integrated with orchestration and boot strapping to provision
/ deprovision instances until the entire data center is running at an optimal
level. Monit, Munin, and Nagios come to mind.

An amazing benefit from utilizing the modern methods above is that one’s
infrastructure heals itself and doesn’t depend on a single failure.

​


