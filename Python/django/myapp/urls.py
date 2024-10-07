from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('register/', views.register, name='register'),
    path('table/<int:table_id>/', views.view_table, name='view_table'),
    path('table/<int:table_id>/edit/', views.edit_table, name='edit_table'),
]
