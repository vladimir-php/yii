<?php

Yii::import('zii.widgets.CPortlet');

class ChatWidget extends CPortlet
{
	protected function renderContent()
	{		
		// css-file
		Yii::app()->clientScript->registerCssFile(
			Yii::app()->assetManager->publish('css/chat.css')
		);
		
		// js-file
		Yii::app()->clientScript->registerScriptFile(
			Yii::app()->assetManager->publish('js/chat.js')
		);
	
		$data = array (
			"list" => Chat::model()->getLast(),
		);
		$this->render('chatwidget', $data);
	}
}