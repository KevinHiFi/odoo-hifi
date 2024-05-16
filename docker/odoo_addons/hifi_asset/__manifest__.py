# -*- coding: utf-8 -*-
{
    'name': 'HiFi Asset Management',
    'version': '1.0',
    'author': 'HiFi Extra - sebastian.reichel@hifi-extra.de',
    'sequence': 1,
    'category': 'HiFi/AssetManagement',
    'description': """
Testdesc""",
     'depends': ['base', 'mail', 'website'],
    'summary': 'HiFi Assetz',
    'website': 'https://www.hifi-extra.de',
    'data': [
        'security/asset.xml',
        'security/ir.model.access.csv',
        'data/asset_data.xml',
        'data/mail_activity_type_data.xml',
        'data/mail_message_subtype_data.xml',
        'views/asset_views.xml',
        'views/mail_activity_views.xml',
        'views/res_config_settings_views.xml',
        'views/views.xml',
    ],
    'demo': ['data/asset_demo.xml'],
    'installable': True,
    'application': True,
    'assets': {
        'web.assets_backend': [
            'hifi_asset/static/src/**/*',
        ],
    },
    'license': 'LGPL-3',
    'controllers': [
        'controllers.controllers.MyAddonWebsiteController',
    ],
}
