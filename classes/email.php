<?php

namespace Classes;

use PHPMailer\PHPMailer\PHPMailer;

class Email
{

    public $email;
    public $nombre;
    public $token;

    public function __construct($email, $nombre, $token)
    {
        $this->email = $email;
        $this->nombre = $nombre;
        $this->token = $token;
    }

    public function enviarConfirmacion()
    {
        //Crear el objeto de email
        $mail = new PHPMailer(true);
        $mail->isSMTP();
        $mail->Host = 'smtp-relay.brevo.com';
        $mail->SMTPAuth = true;
        $mail->Port = 587;
        $mail->Username = '7c0b18001@smtp-brevo.com';
        $mail->Password = '2152d332fb6b93'; // Asegúrate de usar la contraseña correcta
        $mail->SMTPAuth = true;

        $mail->setFrom('cuentas@ecommerceApp.com');
        $mail->addAddress($this->email, $this->nombre);
        $mail->Subject = 'Confirma tu cuenta';
        $mail->isHTML(true);
        $mail->CharSet = 'UTF-8';

        $contenido = "<html><head><style>body {font-family: Arial, sans-serif;background-color: #f0f0f0;display: flex;justify-content: center;align-items: center;height: 100vh;}.container {background-color: #fff;padding: 20px;border-radius: 5px;box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);text-align: center;}a {display: inline-block;margin-top: 20px;padding: 10px 20px;color: #fff;background-color: #368BC1;border-radius: 5px;text-decoration: none;transition: background-color 0.3s ease;}a:hover {background-color: #2a6fb5;}</style></head><body><div class='container'><h2>App Salon</h2><p><strong>Hola " . $this->nombre . ",</strong></p><p>Has creado tu cuenta en app Salon, solo debes confirmarla presionando el siguiente enlace</p><p><a href='http://localhost:3000/confirmar-cuenta?token=" . $this->token . "'>Confirmar Cuenta</a></p><p>Si tu no creaste esta cuenta, solo ignora este mensaje</p></div></body></html>";

        $mail->Body = $contenido;

        //Enviar el email
        $mail->send();
    }

    public function enviarInstrucciones()
    {
        $mail = new PHPMailer(true);
        $mail->isSMTP();
        $mail->Host = 'smtp-relay.brevo.com';
        $mail->SMTPAuth = true;
        $mail->Port = 587;
        $mail->Username = '7c0b18001@smtp-brevo.com';
        $mail->Password = '2152d332fb6b93'; // Asegúrate de usar la contraseña correcta
        $mail->SMTPAuth = true;

        $mail->setFrom('7c0b18001@smtp-brevo.com');
        $mail->addAddress($this->email, $this->nombre);
        $mail->Subject = 'Restablece tu password';
        $mail->isHTML(true);
        $mail->CharSet = 'UTF-8';

        $contenido = "<html><head><style>body {font-family: Arial, sans-serif;background-color: #f0f0f0;display: flex;justify-content: center;align-items: center;height: 100vh;}.container {background-color: #fff;padding: 20px;border-radius: 5px;box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);text-align: center;}a {display: inline-block;margin-top: 20px;padding: 10px 20px;color: #fff;background-color: #368BC1;border-radius: 5px;text-decoration: none;transition: background-color 0.3s ease;}a:hover {background-color: #2a6fb5;}</style></head><body><div class='container'><h2>EcommerceApp</h2><p><strong>Hola " . $this->nombre . ",</strong></p><p>Has solicitado restablecer tu password, sigue el siguiente enlace para hacerlo.</p><p><a href='http://localhost:3000/recuperar?token=" . $this->token . "'>Restablecer Password</a></p><p>Si tu no solicistaste restablecer, solo ignora este mensaje</p></div></body></html>";

        $mail->Body = $contenido;

        //Enviar el email
        $mail->send();
    }
}
