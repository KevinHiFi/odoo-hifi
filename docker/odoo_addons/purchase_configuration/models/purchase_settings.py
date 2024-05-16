from odoo import models, api

class PurchaseSettings(models.Model):
    _inherit = 'res.config.settings'
    _name = 'purchase.settings'
    _description = 'Set initial settings for purchase addon'

    @api.model
    def apply_initial_settings(self):
        self.create({'group_product_variant': True}).execute()
