<?php

class Database
{
    private $host;
    private $db;
    private $user;
    private $password;

    public function __construct()
    {
        $this->host     = 'localhost';
        $this->db       = 'login';
        $this->user     = 'root';
        $this->password = 'root';
    }

    public function connect()
    {
        $con = new mysqli($this->host, $this->user, $this->password, $this->db);
        return $con;
    }
}
