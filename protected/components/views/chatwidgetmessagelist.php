<? foreach ($list as $item): ?>
	<div><?=$item->chatmessage_message?></div>
	<div><small><?=CTimestamp::getStrDateBack($item->chatmessage_date)?></small></div><br />
<? endforeach; ?>