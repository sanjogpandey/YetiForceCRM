{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
* Contributor(s): YetiForce.com
********************************************************************************/
-->*}
{strip}
	<!-- tpl-CommentsList -->
	{if !empty($CHILD_COMMENTS)}
		<div class="ml-4">
	{/if}
	<div class="commentsBody">
		{if !empty($PARENT_COMMENTS) && !empty($SHOW_CHILD_COMMENTS)}
			{foreach key=CURRENT_COMMENT_KEY item=CURRENT_COMMENT from=$PARENT_COMMENTS}
				{include file=\App\Layout::getTemplatePath('Comments.tpl') PARENT_COMMENTS=$CURRENT_COMMENT CURRENT_COMMENT=$CURRENT_COMMENT}
			{/foreach}
		{else}
			{include file=\App\Layout::getTemplatePath('Comments.tpl') PARENT_COMMENTS=$PARENT_COMMENTS CURRENT_COMMENT=$CURRENT_COMMENT}
		{/if}
		<div class="tpl-CommentsList js-noCommentsMsgContainer summaryWidgetContainer noCommentsMsgContainer {if !empty($PARENT_COMMENTS)}d-none{/if}" data-js="container">
			<p class="textAlignCenter"> {\App\Language::translate('LBL_NO_COMMENTS',$MODULE_NAME)}</p>
		</div>
	</div>
	{if !empty($CHILD_COMMENTS)}
		</div>
	{/if}
	{if !$IS_READ_ONLY && empty($NO_COMMENT_FORM)}
		<div class="d-none basicAddCommentBlock my-2">
			<div class="row">
				<div class="col-md-12">
					<div class="input-group">
							<span class="input-group-prepend">
								<span class="input-group-text"><span class="fas fa-comments"></span></span>
							</span>
						<textarea rows="{$COMMENT_TEXTAREA_DEFAULT_ROWS}"
								  class="form-control commentcontenthidden fullWidthAlways" name="commentcontent"
								  title="{\App\Language::translate('LBL_ADD_YOUR_COMMENT_HERE', $MODULE_NAME)}"
								  placeholder="{\App\Language::translate('LBL_ADD_YOUR_COMMENT_HERE', $MODULE_NAME)}"></textarea>
					</div>
					<button class="u-cursor-pointer closeCommentBlock mt-3 btn btn-warning float-right cancel"
							type="reset">
						<span class="visible-xs-inline-block fas fa-times"></span>
						<strong class="d-none d-sm-none d-md-block">{\App\Language::translate('LBL_CANCEL', $MODULE_NAME)}</strong>
					</button>
					<button class="btn btn-success saveComment mt-3 float-right" type="button" data-mode="add">
						<span class="visible-xs-inline-block fas fa-check"></span>
						<strong class="d-none d-sm-none d-md-block">{\App\Language::translate('LBL_POST', $MODULE_NAME)}</strong>
					</button>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		<div class="d-none basicEditCommentBlock">
			<div class="row">
				<div class="col-md-12 my-2">
					<input type="text" name="reasonToEdit"
						   title="{\App\Language::translate('LBL_REASON_FOR_CHANGING_COMMENT', $MODULE_NAME)}"
						   placeholder="{\App\Language::translate('LBL_REASON_FOR_CHANGING_COMMENT', $MODULE_NAME)}"
						   class="input-block-level form-control"/>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 mb-2">
					<div class="input-group">
							<span class="input-group-prepend">
								<span class="input-group-text"><span class="fas fa-comments"></span></span>
							</span>
						<textarea rows="{$COMMENT_TEXTAREA_DEFAULT_ROWS}"
								  class="form-control commentcontenthidden fullWidthAlways" name="commentcontent"
								  title="{\App\Language::translate('LBL_ADD_YOUR_COMMENT_HERE', $MODULE_NAME)}"
								  placeholder="{\App\Language::translate('LBL_ADD_YOUR_COMMENT_HERE', $MODULE_NAME)}"></textarea>
					</div>
					<button class="u-cursor-pointer closeCommentBlock mt-3 btn btn-warning float-right cancel"
							type="reset">
						<span class="visible-xs-inline-block fas fa-times"></span>
						<strong class="d-none d-sm-none d-md-block">{\App\Language::translate('LBL_CANCEL', $MODULE_NAME)}</strong>
					</button>
					<button class="btn btn-success saveComment mt-3 float-right" type="button" data-mode="edit">
						<span class="visible-xs-inline-block fas fa-check"></span>
						<strong class="d-none d-sm-none d-md-block">{\App\Language::translate('LBL_POST', $MODULE_NAME)}</strong>
					</button>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	{/if}
	<!-- /tpl-CommentsList -->
{/strip}
