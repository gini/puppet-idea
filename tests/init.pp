# Learn more about module testing here:
# http://docs.puppetlabs.com/guides/tests_smoke.html
class { 'idea': }
class { 'idea':
  version => '11.1.4'
}
class { 'idea::ultimate': }
class { 'idea::ultimate':
  version => '11.1.4'
}
