<?php
class Chat extends CActiveRecord
{
	const Table		= "chatmessage";

	const Id 		= "chatmessage_id";
	const Message	= "chatmessage_message";
	const Status	= "chatmessage_status";
	const Date		= "chatmessage_date";
	
	const StatusDeny		= 0;
	const StatusApproved	= 1;
	

	/**
	 * Returns the static model of the specified AR class.
	 * @return CActiveRecord the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return '{{'.self::Table.'}}';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array(self::Message, 'required'),
			array(self::Message, 'length', 'max'=>100),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
			'post' => array(self::BELONGS_TO, 'Post', 'post_id'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'chat_id'		=> 'Id',
			'chat_message'	=> 'Message',
			'chat_status'	=> 'Status',
			'chat_date'		=> 'Date',
		);
	}
	
	
	/**
	 * Get last messages
	 *
	 * @param int
	 * @return array
	 */
	public function getLast ($limit = 15)
	{
		return $this->findAll(array(
			'condition'	=>'t.'.self::Status.'='.self::StatusApproved,
			'order'		=>'t.'.self::Date.' DESC',
			'limit'		=> $limit,
		));
	}
	
	
	/**
	 * Add new message
	 *
	 * @param string
	 */
	public function Add ($text)
	{
		$message = new Chat;
		$message->chatmessage_message	= $text;
		$message->save();
	}
	

	/**
	 * This is invoked before the record is saved.
	 * @return boolean whether the record should be saved.
	 */
	protected function beforeSave()
	{
		if(parent::beforeSave())
		{
			if($this->isNewRecord)
				$this->chatmessage_date = date("Y-m-d H:i:s");
			return true;
		}
		else
			return false;
	}
}