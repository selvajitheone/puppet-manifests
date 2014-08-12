define mysql::database($db = $title) {
    exec { "create-user-${user}-all":
        unless => "mysql -uroot -p${mysql::root_password} -e \"SHOW DATABASES;\" | grep ${db}",
        path => "/bin:/usr/bin",
        command => "mysql -uroot -p${mysql::root_password} -e \"CREATE DATABASE ${db};\"",
        require => Class["mysql"],
    }
}
