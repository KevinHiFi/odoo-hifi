# -*- coding: utf-8 -*-
{
    'name': "estate",
    'version': '1.0',
    'depends': ['base','web'],
    "data": [
        "security/ir.model.access.csv",
        "views/estate_property_offer_views.xml",
        "views/estate_property_tag_views.xml",
        "views/estate_property_type_views.xml",
        "views/estate_property_views.xml",
        "views/res_users_views.xml",
        "views/estate_menus.xml",
    ],
    'installable': True,
    'application': True,
    'auto_install': False,
    "license": "LGPL-3",
}

