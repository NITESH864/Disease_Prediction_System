from django.test import TestCase
from django.urls import reverse


class DeploymentConfigurationTests(TestCase):
    def test_index_route_is_available(self):
        response = self.client.get(reverse("index"))
        self.assertEqual(response.status_code, 200)

    def test_prediction_route_is_available(self):
        response = self.client.get(reverse("prediction"))
        self.assertEqual(response.status_code, 200)
