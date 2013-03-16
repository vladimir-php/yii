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
		if (!$message || strlen($message) >= Chat::MaxMessageLength) {
			return;
		}
		$message = htmlspecialchars($message, ENT_QUOTES);
		Chat::model()->Add($message);
		
		// render messsage list for response
		$this->actionLoadlist ();
	}	
	
	
	/**
	 * Load list of messages
	 */
	public function actionLoadlist ()
	{
		$ChatWidget = new ChatWidget();
		$ChatWidget->renderMessageList ();
	}	


}