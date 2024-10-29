# 🖱️ Logitech Mouse Poll Rate Adjuster for Linux

Этот репозиторий содержит скрипт для настройки частоты опроса мыши Logitech на Ubuntu/Linux. Частота опроса может влиять на загрузку процессора. Этот скрипт позволяет изменить параметр `mousepoll`, чтобы снизить нагрузку на процессор, изменяя частоту опроса USB-порта, к которому подключена мышь.

## 📋 Содержание
- [Установка](#Установка)
- [Использование](#Использование)
- [Удаление](#Удаление)
- [Замечания](#Замечания)

## Установка

1. **Скачайте или склонируйте репозиторий:**

    ```bash
    git clone https://github.com/username/mouse-poll-adjuster.git
    cd mouse-poll-adjuster
    ```

2. **Создайте и отредактируйте скрипт:**

    Вставьте код скрипта в новый файл `/usr/local/bin/set_mouse_poll.sh`:
    ```bash
    sudo nano /usr/local/bin/set_mouse_poll.sh
    ```
    
    Вставьте следующий код в файл и сохраните:
    ```bash
    #!/bin/bash
    
    # Устанавливаем частоту опроса для мыши
    echo "options usbhid mousepoll=8" | sudo tee /etc/modprobe.d/usbhid.conf
    
    # Перезагружаем модуль usbhid, чтобы изменения вступили в силу
    sudo modprobe -r usbhid
    sudo modprobe usbhid
    ```

3. **Сделайте скрипт исполняемым:**

    ```bash
    sudo chmod +x /usr/local/bin/set_mouse_poll.sh```

## Использование

Чтобы применить настройки, просто выполните скрипт:

```bash
sudo /usr/local/bin/set_mouse_poll.sh
```

> [!NOTE]
> Этот скрипт устанавливает частоту опроса мыши на 8 мс (125 Гц). Вы можете изменить значение ```mousepoll``` в скрипте на другое (например, ```4``` для 250 Гц или ```2```для 500 Гц) перед запуском.

## Удаление
Для отмены изменений выполните следующую команду, чтобы удалить файл конфигурации 
```usbhid.conf```
```bash
sudo rm /etc/modprobe.d/usbhid.conf
sudo modprobe -r usbhid
sudo modprobe usbhid```

