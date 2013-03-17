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
		$data = array (
			"list" => Chat::model()->getLast(),
		);
		$this->render('chatwidgetmessagelist', $data);
	}
	
}