<!-- TestApp.app -->
<aura:application access="global" extends="force:slds">

	<h1>Hello World</h1>

    <c:TestCmp />

</aura:application>

<!-- TestCmp.cmp -->
<aura:component implements="flexipage:availableForAllPageTypes" access="global" >
    
	<div class="slds-button-group" role="group" style="margin:5px;">
		<button class="slds-button slds-button_neutral">
			Refresh
		</button>
		<button class="slds-button slds-button_neutral">
			Edit
		</button>
		<button class="slds-button slds-button_neutral">
			Save
		</button>
	</div>

	<div style="width:300px; height:300px; border:1px solid black; margin:5px;" class="slds-align_absolute-center">
	
    	Centered Content
    
	</div>
    
</aura:component>