from django.db import models

# Create your models here.
class History(models.Model):
       fever=models.CharField(max_length=10)
       headache=models.CharField(max_length=10)
       nausea=models.CharField(max_length=10)
       vomiting=models.CharField(max_length=10)
       fatigue=models.CharField(max_length=10)
       joint_pain=models.CharField(max_length=10)
       skin_rash=models.CharField(max_length=10)
       cough=models.CharField(max_length=10)
       weight_loss=models.CharField(max_length=10)
       yellow_eyes=models.CharField(max_length=10)
       res=models.CharField(max_length=100)

