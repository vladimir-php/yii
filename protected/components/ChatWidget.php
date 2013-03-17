<?php

Yii::import('zii.widgets.CPortlet');

class ChatWidget extends CPortlet
{

	/**
	 * Render
	 */
	protected function renderContent()
	{		
		// if was disabled in config
		if (!Yii::app()->isChatEnable() ) {
			return;
		}
		
		// jquery-files
		Yii::app()->clientScript->registerCoreScript('jquery');
			
		// css-file
		Yii::app()->clientScript->registerCssFile(
			Yii::app()->assetManager->publish('css/chat.css')
		);
		
		// js-files
		Yii::app()->clientScript->registerScriptFile(
			Yii::app()->assetManager->publish('js/chat.js')
		);
	
		$this->render('chatwidget', $data);
	}
	
	
	/**
	 * Render a message list
	 */
	public function renderMessageList ()
	{
		$message_list = Chat::model()->getLast();
	
		// get user id list
		$user_ids = array ();
		foreach ($message_list as $message_info) {
			$user_id = &$message_info->chatmessage_user_id;
			if (!$user_id || $user_id == -1) continue;
			$user_ids[] = $user_id;
		}
		$user_ids = array_unique ($user_ids);
	
		// get user list
		$user_list = User::model()->getListByListId($user_ids);
		
		
		// prepare user list
		$tmp_array = array ();
		foreach ($user_list as $key => $user_info) {
			$tmp_array[$user_info->id] = $user_info;
		}
		$user_list = $tmp_array;
		
		
		// attach user info for list
		$message_show_list = array ();
		foreach ($message_list as $key => $message_info) {
			$message_show = array (
				"message"	=> $message_info->chatmessage_message,
				"date"		=> $message_info->chatmessage_date,
			);
			
			$user_id = &$message_info->chatmessage_user_id;
			if (isset($user_list[$user_id]) ) {
				$message_show["username"] = $user_list[$user_id]->username;
			}
			else {
				$message_show["username"] = "Guest";
			}
			
			$message_show_list[] = (object)$message_show;
		}

	
		$data = array (
			"list" => $message_show_list,
		);		
		$this->render('chatwidgetmessagelist', $data);
	}
	
}