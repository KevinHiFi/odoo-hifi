from odoo.tests.common import TransactionCase

class TestConfigurations(TransactionCase):
    def setUp(self):
        super(TestConfigurations, self).setUp()
        self.company = self.env.ref('base.main_company')

    def test_company_name(self):
        """Test the company name is set correctly by the configuration"""
        self.assertEqual(self.company.name, 'HiFi extra GmbH')
