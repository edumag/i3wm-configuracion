# Personalización i3wm

![](/home/edumag/.config/i3/img/Screenshot-01.png)

## Instalación

```
sudo apt-get install i3 dunst compton

```


## Extras

## font-awesome
## rofi y rofi calc
## dunst (Notificaciones)

## pasystray (Volumen)

`sudo apt-get install pasystray lxappareance`

Al lanzar pasystray el icono oscuro no se ve bien.
Lanzamos lxappareance para cambiar el tema gtk y los iconos.

## Configuración de touchpad.

```
sudo mkdir -p /etc/X11/xorg.conf.d && sudo tee <<'EOF' /etc/X11/xorg.conf.d/90-touchpad.conf 1> /dev/null
Section "InputClass"
        Identifier "touchpad"
        MatchIsTouchpad "on"
        Driver "libinput"
        Option "Tapping" "on"
EndSection

EOF
```
### Referencias

- https://cravencode.com/post/essentials/enable-tap-to-click-in-i3wm/

## Referencias

- [Una buena explicación de como funciona](https://github.com/bookercodes/dotfiles.git)

