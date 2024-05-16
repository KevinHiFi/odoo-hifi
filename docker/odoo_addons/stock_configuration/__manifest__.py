{
    'name': 'Stock Configuration',
    'version': '1.0',
    'summary': 'Configures the stock settings',
    'category': 'Tools',
    'author': 'Julian Maltenberger [Soniverse]',
    'website': 'https://soniverse.de',
    'depends': ['stock'],
    'data': [
        'security/stock_settings_security.xml',
        'data/initial_setup.xml',
    ],
    'installable': True,
    'application': False,
    'auto_install': False,
}
