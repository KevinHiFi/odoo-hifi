{
    'name': 'Purchase Configuration',
    'version': '1.0',
    'summary': 'Configures the purchase settings',
    'category': 'Tools',
    'author': 'Julian Maltenberger [Soniverse]',
    'website': 'https://soniverse.de',
    'depends': ['purchase'],
    'data': [
        'security/purchase_settings_security.xml',
        'data/initial_setup.xml',
    ],
    'installable': True,
    'application': False,
    'auto_install': False,
}
