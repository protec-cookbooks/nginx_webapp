name             'nginx_webapp'
maintainer       'Protec Innovations'
maintainer_email 'dev@protecinnovations.co.uk'
license          'GPLv3'
description      'Provides an nginx_webapp definition'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

%w{ nginx }.each do |cb|
  depends cb
end

