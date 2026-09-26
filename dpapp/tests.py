from django.test import TestCase
from django.urls import reverse


class LocalStartupSmokeTests(TestCase):
    def test_index_page_loads(self):
        response = self.client.get(reverse("index"))
        self.assertEqual(response.status_code, 200)

    def test_prediction_page_loads(self):
        response = self.client.get(reverse("prediction"))
        self.assertEqual(response.status_code, 200)
