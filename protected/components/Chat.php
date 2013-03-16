<?php

Yii::import('zii.widgets.CPortlet');

class Chat extends CPortlet
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
	
		$this->render('chat');
	}
}