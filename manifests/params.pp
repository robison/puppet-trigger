#


class trigger::params {
$version = '1.4.4'
$packages = ''
$prefix = '/etc/trigger'
$use_gpg_auth = False
$user_home = 'os.getenv('HOME')'
$tacacsrc = 'os.getenv('TACACSRC', os.path.join(USER_HOME, '.tacacsrc'))'
$tacacsrc_keyfile = 'os.getenv('TACACSRC_KEYFILE', os.path.join(PREFIX, '.tackf'))'
$tacacsrc_passphrase = '' # NYI
$default_realm = 'aol'
$builtin_plugins = [
    'trigger.contrib.commando.plugins.config_device',
    'trigger.contrib.commando.plugins.show_clock',
    'trigger.contrib.commando.plugins.show_version'
    ]
$commando_plugins = $builtin_plugins
$firewall_dir = '/data/firewalls'
$tftproot_dir = '/data/tftproot'
$tftp_host = ''
$internal_networks = [ '10.0.0.0/8', '172.16.0.0/12', '192.168.0.0/16' ]
$supported_vendors = [
    'a10',
    'arista',
    'aruba',
    'brocade',
    'cisco',
    'citrix',
    'dell',
    'f5',
    'force10',
    'foundry',
    'juniper',
    'mrv',
    'netscreen',
    'paloalto',
]
$valid_vendors = $supported_vendors
$vendor_map = {
    'A10 NETWORKS' => 'a10',
    'ARISTA NETWORKS' => 'arista',
    'ARUBA NETWORKS' => 'aruba',
    'BROCADE' => 'brocade',
    'CISCO SYSTEMS' => 'cisco',
    'CITRIX' => 'citrix',
    'DELL' => 'dell',
    'F5 NETWORKS' => 'f5',
    'FORCE10' => 'force10',
    'FOUNDRY' => 'foundry',
    'JUNIPER' => 'juniper',
    'MRV' => 'mrv',
    'NETSCREEN TECHNOLOGIES' => 'netscreen',
}
$supported_platforms = {
    'a10' => 'SWITCH',
    'arista' => 'SWITCH',
    'aruba' => 'SWITCH',
    'brocade' => ''ROUTER', 'SWITCH'',
    'cisco' => ''ROUTER', 'SWITCH'',
    'citrix' => 'SWITCH',
    'dell' => 'SWITCH',
    'f5' => ''LOAD BALANCING', 'SWITCH'',
    'force10' => ''ROUTER', 'SWITCH'',
    'foundry' => ''ROUTER', 'SWITCH'',
    'juniper' => ''FIREWALL', 'ROUTER', 'SWITCH'',
    'mrv' => ''CONSOLE SERVER', 'SWITCH'',
    'netscreen' => 'FIREWALL'],
    'paloalto' => 'FIREWALL',
}
$supported_types = [ 'CONSOLE SERVER', 'FIREWALL', 'DWDM', 'LOAD BALANCING',
                   'ROUTER', 'SWITCH' ]
$default_types = {
    'a10' => 'SWITCH',
    'arista' => 'SWITCH',
    'aruba' => 'SWITCH',
    'brocade' => 'SWITCH',
    'citrix' => 'SWITCH',
    'cisco' => 'ROUTER',
    'dell' => 'SWITCH',
    'f5' => 'LOAD BALANCING',
    'force10' => 'ROUTER',
    'foundry' => 'SWITCH',
    'juniper' => 'ROUTER',
    'mrv' => 'CONSOLE SERVER',
    'netscreen' => 'FIREWALL',
    'paloalto' => 'FIREWALL',
}
$fallback_type = 'ROUTER'
$default_timeout = '5 * 60'
$telnet_timeout  = 60
$telnet_enabled = True
$ssh_port = 22
$telnet_port = 23
$ssh_pty_disabled = {
    'dell' => 'SWITCH', }

$ssh_async_disabled = {
    'dell' => 'SWITCH',
    'foundry' => 'SWITCH',
}

$ioslike_vendors = []
    'a10',
    'arista',
    'aruba',
    'brocade',
    'cisco',
    'dell',
    'force10',
    'foundry',
]

$gorc_file = '~/.gorc'
$gorc_allowed_commands = [
    'cli',
    'enable',
    'exit',
    'get',
    'monitor',
    'ping',
    'quit',
    'set',
    'show',
    'start',
    'term',
    'terminal',
    'traceroute',
    'who',
    'whoami'
]

$with_acls = True
$autoacl_file = 'os.environ.get('AUTOACL_FILE', os.path.join(PREFIX, 'autoacl.py'))'
$netdevices_loaders = [
    'trigger.netdevices.loaders.filesystem.XMLLoader',
    'trigger.netdevices.loaders.filesystem.JSONLoader',
    'trigger.netdevices.loaders.filesystem.SQLiteLoader',
    'trigger.netdevices.loaders.filesystem.RancidLoader',
    'trigger.netdevices.loaders.filesystem.CSVLoader',
]

$netdevices_source = 'os.environ.get('NETDEVICES_SOURCE', os.path.join(PREFIX,'netdevices.xml'))'
$netdevices_file = $netdevices_source
$rancid_recurse_subdirs = 'os.environ.get('RANCID_RECURSE_SUBDIRS', False)'
$valid_owners = [
    #'Data Center',
    #'Backbone Engineering',
    #'Enterprise Networking',
]

$juniper_full_commit_fields = {
    #'deviceType' => 'SWITCH',
    #'make' => 'EX4200',
}

prompt_patterns = {
    'aruba' => 'r'\(\S+\)(?: \(\S+\))?\s?#$', # ArubaOS 6.1
    #'aruba' => 'r'\S+(?: \(\S+\))?\s?#\s$', # ArubaOS 6.2
    'citrix' => 'r'\sDone\n$',
    'f5' => 'r'.*\(tmos\).*?#\s{1,2}\r?$',
    'juniper' => 'r'\S+\@\S+(?:\>|#)\s$',
    'mrv' => 'r'\r\n?.*(?:\:\d{1})?\s\>\>?$',
    'netscreen' => 'r'(\w+?:|)[\w().-]*\(?([\w.-])?\)?\s*->\s*$',
    'paloalto' => 'r'\r\n\S+(?:\>|#)\s?$',
}

$ioslike_prompt_pat = 'r'\S+(\(config(-[a-z:1-9]+)?\))?#\s?$''
$ioslike_enable_pat = 'r'\S+(\(config(-[a-z:1-9]+)?\))?>\s?$''
$default_prompt_pat = 'r'\S+#\s?$''
$bounce_file = 'os.environ.get('BOUNCE_FILE', os.path.join(PREFIX, 'bounce.py'))'
$bounce_default_tz = 'US/Eastern'
$bounce_default_color = 'red'
$redis_host = '127.0.0.1'
$redis_port = 6379
$redis_db = 0
$database_engine = 'mysql'
$database_name = ''
$database_user = ''
$database_password = ''
$database_host = ''
$database_port = ''
$allow_juniper_multiline_comments = False
$ignored_acls = []
$nonmod_acls  = []
$vips = {}
$autoload_blacklist = []
$autoload_filter = $autoload_blacklist
$autoload_filter_thresh = {}
$autoload_bulk_thresh = 10
$bulk_max_hits = {}
$bulk_max_hits_default = 1
$get_current_oncall = 'lambda x=None: x'
$email_sender = 'nobody@not.real'
$success_emails = [ 'neteng@example.com',]
$failure_emails = [ 'primarypager@example.com', 'secondarypager@example.com',]
$notification_sender = socket.gethostname()
$success_recipients = [ 'foo.example.com', ]
$failure_recipients = [ socket.gethostname() ]
$notification_handlers = [ 'trigger.utils.notifications.handlers.email_handler',]

}
