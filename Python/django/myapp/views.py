from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required, permission_required
from django.contrib.auth import login, authenticate
from django.contrib.auth.forms import UserCreationForm
from .models import Table, TablePermission

@login_required
def home(request):
    return render(request, 'home.html')

def register(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            user = form.save()
            login(request, user)
            return redirect('home')
    else:
        form = UserCreationForm()
    return render(request, 'registration/register.html', {'form': form})

@login_required
@permission_required('myapp.view_table', raise_exception=True)
def view_table(request, table_id):
    table = Table.objects.get(id=table_id)
    return render(request, 'view_table.html', {'table': table})

@login_required
@permission_required('myapp.change_table', raise_exception=True)
def edit_table(request, table_id):
    table = Table.objects.get(id=table_id)
    # Add logic for editing the table
    return render(request, 'edit_table.html', {'table': table})
