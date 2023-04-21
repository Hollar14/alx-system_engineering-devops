# Using Puppet, create a manifest that kills a process named killmenow.
# Requirements:
# Must use the exec Puppet resource
# Must use pkill
exec { 'killing a process using pkill':
  command  => 'pkill -9 killmenow',
  path     => '/usr/bin:/bin',
  onlyif   => 'pgrep killmenow',
  provider => shell,
}
