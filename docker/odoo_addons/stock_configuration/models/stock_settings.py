from odoo import models, api

class StockSettings(models.Model):
    _inherit = 'res.config.settings'
    _name = 'stock.settings'
    _description = 'Set initial settings for stock addon'

    @api.model
    def apply_initial_settings(self):
        self.create({'group_stock_multi_locations': True}).execute()
