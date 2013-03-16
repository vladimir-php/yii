<?php

class ChatController extends Controller
{
	/**
	 * @var CActiveRecord the currently loaded data model instance.
	 */
	private $_model;


	/**
	 * Add chat message
	 */
	public function actionAddmessage ()
	{
		$message = strip_tags($_REQUEST["message"]);
		if (!$message || strlen($message) >= 100) {
			return;
		}
		$message = htmlspecialchars($message, ENT_QUOTES);
		Chat::model()->Add($message);
	}	
	
	
	/**
	 * Load list of messages
	 */
	public function actionLoadlist ()
	{
		print_r(Chat::model()->getLast());
	}	


}