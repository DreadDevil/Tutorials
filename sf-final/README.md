Terraform для развертывания инфраструктуры в Яндекс.Облаке
Эта конфигурация Terraform разворачивает инфраструктуру в Яндекс.Облаке, состоящую из кластера Kubernetes с двумя серверами (1 master и 1 app) и сервера "srv" для инструментов мониторинга, логгирования и сборки контейнеров.

Необходимые зависимости
Terraform v0.13+ (установка)
Учетная запись Яндекс.Облака
Подготовка
Клонируйте репозиторий:
git clone https://github.com/DreadDevil/Tutorials.git
cd your-github-repo
Создайте файл terraform.tfvars со следующим содержимым:

yandex_cloud_token    = "your_yandex_cloud_token"
yandex_cloud_id       = "your_yandex_cloud_id"
yandex_cloud_folder_id = "your_yandex_cloud_folder_id"
yandex_cloud_zone     = "your_yandex_cloud_zone"
Замените your_yandex_cloud_token, your_yandex_cloud_id, your_yandex_cloud_folder_id и your_yandex_cloud_zone на соответствующие значения вашей учетной записи в Яндекс.Облаке.

Добавьте файл terraform.tfvars в файл .gitignore, чтобы исключить его из системы контроля версий:
echo "terraform.tfvars" >> .gitignore

Развертывание инфраструктуры
Инициализируйте Terraform:
terraform init

Проверьте план изменений, которые Terraform собирается внести:
terraform plan

Если план соответствует ожиданиям, примените изменения:
terraform apply
После успешного выполнения команды terraform apply ваша инфраструктура будет создана в Яндекс.Облаке.

Удаление инфраструктуры
Для удаления созданной инфраструктуры выполните:
terraform destroy
Эта команда удалит все ресурсы, созданные Terraform, из вашего Яндекс.Облака.