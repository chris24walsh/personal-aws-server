class { 'apache': 
	default_vhost => false,
}

apache::vhost { 'spacehorse.chriswalsh.tk':
  port    => '80',
  docroot => '/var/www/spacehorse',
	before => Vcsrepo['/var/www/spacehorse'],
}

package {'git':
 ensure => latest,
}

vcsrepo { '/var/www/spacehorse':
	ensure => present,
	provider => git,
	source => 'git://github.com/chris24walsh/spacehorse2.0.git',
	before => File['js_folder'],
}

file { 'js_folder':
	path => '/var/www/spacehorse/js',
	ensure => 'directory',
	before => Wget::Fetch['phaser.min.js'],
}

include wget

wget::fetch {'phaser.min.js':
	source => 'https://github.com/photonstorm/phaser-ce/releases/download/v2.9.2/phaser.min.js',
	destination => '/var/www/spacehorse/js/phaser.min.js',
	timeout            => 0,
  verbose            => true,
  nocheckcertificate => true,
}
