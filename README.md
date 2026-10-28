# Mod Menu Package

Source dump entries: 12

- Field: HotUpdate — HotUpdate.dll.TapManager.DebugInfiniteEnergy | field 0x41 - write true via HotUpdate — HotUpdate.dll.TapManager.Update (RVA 0x675844)
- Method: HotUpdate — HotUpdate.dll.CardManager.GetMoneyAds | RVA 0x614CA4 - 16 bytes
- Method: UnityEngine.Purchasing — UnityEngine.Purchasing.Stores.dll.AppleStoreImpl.IsValidPurchaseState | RVA 0x49C7E68 - 8 bytes
- Method: HotUpdate — HotUpdate.dll.DrawCardManager.CanGoldDrawCardX1 | RVA 0x62FC68 - 8 bytes
- Method: UnityEngine.Purchasing — UnityEngine.Purchasing.dll.PurchasingManager.HasAvailableProductsToPurchase | RVA 0x49E8EF8 - 8 bytes
- Field: HotUpdate — HotUpdate.dll.CardManager.UnlockProductLevel | field 0x4C - write 999 via HotUpdate — HotUpdate.dll.CardManager.OnInit (RVA 0x675844)
- Field: HotUpdate — HotUpdate.dll.SignManager.UnlockProductLevel | field 0x44 - write 999 via HotUpdate — HotUpdate.dll.SignManager.OnInit (RVA 0x675844)
- Field: UnityEngine.Scripting — UnityEngine.SharedInternalsModule.dll.CutRopeManager.UnlockProductLevel | field 0x24 - write 999 via UnityEngine.Scripting — UnityEngine.SharedInternalsModule.dll.CutRopeManager.CloseCutRopeGiftRed (RVA 0x675844)
- Field: UnityEngine.Scripting — UnityEngine.SharedInternalsModule.dll.Enemy.bulletSpeed | field 0x44 - write 12.000 via UnityEngine.Scripting — UnityEngine.SharedInternalsModule.dll.Enemy.Update (RVA 0x675844)
- Field: UnityEngine.Scripting — UnityEngine.SharedInternalsModule.dll.GirlfriendManager.UnlockProductLevel | field 0x70 - write 999 via UnityEngine.Scripting — UnityEngine.SharedInternalsModule.dll.GirlfriendManager.OnInit (RVA 0x675844)
- Method: UnityGameFramework.Runtime — UnityGameFramework.Runtime.dll.MainModule.get_startLifetimeMultiplier | RVA 0x4977F80 - 16 bytes
- Method: UnityGameFramework.Runtime — UnityGameFramework.Runtime.dll.TrailModule.get_lifetimeMultiplier | RVA 0x497BFCC - 16 bytes

## Integration

1. Add ModMenu.swift, Patcher.swift and Cheats.swift to the target application in Nyxian.
2. In SceneDelegate.scene(_:willConnectTo:options:), after window.makeKeyAndVisible(), call:
   ModMenu.shared.install()
3. The image search string is set in CheatCenter.install(). It defaults to "UnityFramework".
4. Build and run. Method patches are toggled from the floating MOD button.

## Notes

- RVAs are applied relative to the first loaded image whose path contains "UnityFramework". If no image matches, nothing is patched or hooked.
- Set the search string to "main" (case-insensitive) to resolve the main executable directly. Empty names also select the main executable.
- Field hooks resolve MSHookFunction through dlsym(RTLD_DEFAULT), then libsubstrate and libellekit at /usr/lib and /var/jb/usr/lib.
- Method patches store the original bytes and restore them when the switch is turned off.
- Field writes are performed by a capture hook on the listed zero-argument void instance method. The hook preserves the implicit il2cpp MethodInfo argument when it forwards to the original method.
- Entries whose image, hook, or target cannot be resolved are skipped at install time.