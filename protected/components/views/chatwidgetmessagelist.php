<? foreach ($list as $item): ?>
	<div><?=$item->username?>: <?=$item->message?></div>
	<div><small><?=CTimestamp::getStrDateBack($item->date)?></small></div><br />
<? endforeach; ?>