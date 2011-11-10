#tag Class
Class NSRunningApplication
Inherits NSObject
	#tag Method, Flags = &h0
		Function Activate() As Boolean
		  #if targetMacOS
		    declare function activateWithOptions lib CocoaLib selector "activateWithOptions:" (obj_id as Ptr, options as Integer) as Boolean
		    
		    return activateWithOptions(self, 0)
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		 Shared Function CurrentApplication() As NSRunningApplication
		  #if targetMacOS
		    declare function currentApplication lib CocoaLib selector "currentApplication" (class_id as Ptr) as Ptr
		    
		    dim p as Ptr = currentApplication(Cocoa.NSClassFromString("NSRunningApplication"))
		    if p <> nil then
		      return new NSRunningApplication(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Icon() As NSImage
		  #if targetMacOS
		    declare function icon lib CocoaLib selector "icon" (obj_id as Ptr) as Ptr
		    
		    dim p as Ptr = icon(self)
		    if p <> nil then
		      return new NSImage(p)
		    else
		      return nil
		    end if
		  #endif
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  #if targetMacOS
			    declare function localizedName lib CocoaLib selector "localizedName" (obj_id as Ptr) as Ptr
			    
			    return CFStringRetain(localizedName(self))
			  #endif
			End Get
		#tag EndGetter
		LocalizedName As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Description"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
			InheritedFrom="NSObject"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LocalizedName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass