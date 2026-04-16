from django.contrib import admin
from django.urls import path
from dpapp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
    path('prediction/', views.prediction, name='prediction'),
    path('fpred/', views.fpred, name='fpred'),
    path('history/', views.history, name='history'),
]
