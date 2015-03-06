<?php
# index.php

include("UserController.php");

$userCtrlrInstance = new UserController();

print($userInstance->Test());

?>