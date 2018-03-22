<!-- Module 5 Unit Review Question 4 Solution -->
<aura:application extends="force:slds">

    <strong>Using SLDS</strong>
    <div class="slds-grid slds-wrap ">              
        <div class="slds-col slds-size_1-of-1 slds-box">Header</div>           
        <div class="slds-col slds-size_2-of-3 slds-box">               
            <div class="slds-grid slds-wrap">                    
                <div class="slds-col slds-size_1-of-1 slds-box">Content a</div>                    
                <div class="slds-col slds-size_6-of-12 slds-box">Content b</div>                   
                <div class="slds-col slds-size_6-of-12 slds-box">Content c</div>                      
            </div>           
        </div>            
        <div class="slds-col slds-size_1-of-3 slds-box">Aside</div>
    </div>
    
    <hr/>
    <strong>Using SLDS - better example courtesy David from Sage</strong>
    <div class="slds-grid slds-grid_vertical-stretch">
        <div class="slds-col slds-box">Header</div>
    </div>
    <div class="slds-grid slds-grid_vertical-stretch">
        <div class="slds-col ">
            <div class="slds-col slds-box">Content A</div>
            <div class="slds-grid slds-grid_vertical-stretch">
                <div class="slds-col slds-box">Content B</div>
                <div class="slds-col slds-box">Content C</div>
            </div>
        </div>
        <div class="slds-col slds-box">Aside</div>
    </div>

    <hr/>
    <strong>Using Lightning base components</strong>
    <lightning:layout class="slds-wrap">
        <lightning:layoutItem size="12" class="slds-box">Header</lightning:layoutItem>
        <lightning:layoutItem size="8" >
            <lightning:layout class="slds-wrap">
                <lightning:layoutItem size="12" class="slds-box">Content a</lightning:layoutItem>
                <lightning:layoutItem size="6" class="slds-box">Content b</lightning:layoutItem>
                <lightning:layoutItem size="6" class="slds-box">Content c</lightning:layoutItem>
            </lightning:layout>
        </lightning:layoutItem>
        <lightning:layoutItem size="4" class="slds-box">Aside</lightning:layoutItem>
    </lightning:layout>

    <!-- OR - bit better -->
    <hr/>
    <strong>Using Lightning base components plus</strong>
    <lightning:layout verticalAlign="stretch" horizontalAlign="space" class="slds-wrap" 
                      pullToBoundary="small">
        <lightning:layoutItem flexibility="grow" size="12" class="slds-box">
            Header
        </lightning:layoutItem>
        <lightning:layoutItem flexibility="grow" size="9">
            <lightning:layout horizontalAlign="space" class="slds-wrap">
                <lightning:layoutItem flexibility="grow" size="12" class="slds-box">
                    Content a
                </lightning:layoutItem>
                <lightning:layoutItem flexibility="grow" size="6" class="slds-box">
                    Content b
                </lightning:layoutItem>
                <lightning:layoutItem flexibility="grow" size="6" class="slds-box">
                    Content c
                </lightning:layoutItem>
            </lightning:layout>
        </lightning:layoutItem>
        <lightning:layoutItem flexibility="no-shrink" size="3" class="slds-box">
            Aside
        </lightning:layoutItem>
    </lightning:layout> 

    <!-- OR (courtesy Carl from Deloitte) -->
    <lightning:layout horizontalAlign="spread" verticalAlign="stretch" multipleRows="true">
        <lightning:layoutItem size="12" class="slds-box">
            Header
        </lightning:layoutItem>
        <lightning:layoutItem size="8">
            <lightning:layoutItem size="12" class="slds-box">
                Content A
            </lightning:layoutItem>
            <lightning:layout horizontalAlign="spread">
                <lightning:layoutItem size="6" class="slds-box">
                    Content B 
                </lightning:layoutItem>
                <lightning:layoutItem size="6" class="slds-box">
                    Content C
                </lightning:layoutItem>
            </lightning:layout>
        </lightning:layoutItem>
        <lightning:layoutItem size="4" class="slds-box">
            Aside
        </lightning:layoutItem>
    </lightning:layout>

</aura:application>