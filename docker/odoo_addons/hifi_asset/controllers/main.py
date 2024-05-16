from odoo import http
from odoo.http import request

class MyAddonWebsiteController(http.Controller):

    @http.route('/my-addon-page', auth='public', website=True)
    def my_addon_page(self):
        my_addon_records = request.env['my.addon.model'].sudo().search([])
        return http.request.render('my_addon_website.my_addon_website_page', {
            'my_addon_records': my_addon_records
        })
