from django.test import TestCase
from django.urls import reverse


class PageResponseTests(TestCase):
    def test_index_page_loads(self):
        response = self.client.get(reverse("index"), follow=True)
        self.assertEqual(response.status_code, 200)

    def test_prediction_page_loads(self):
        response = self.client.get(reverse("prediction"), follow=True)
        self.assertEqual(response.status_code, 200)

    def test_file_prediction_page_loads(self):
        response = self.client.get(reverse("fpred"), follow=True)
        self.assertEqual(response.status_code, 200)

    def test_history_page_loads(self):
        response = self.client.get(reverse("history"), follow=True)
        self.assertEqual(response.status_code, 200)
