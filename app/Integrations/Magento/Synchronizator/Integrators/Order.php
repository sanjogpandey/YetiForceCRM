<?php

/**
 * Order integration.
 *
 * @package Integration
 *
 * @copyright YetiForce Sp. z o.o
 * @license   YetiForce Public License 3.0 (licenses/LicenseEN.txt or yetiforce.com)
 * @author    Arkadiusz Dudek <a.dudek@yetiforce.com>
 * @author    Mariusz Krzaczkowski <m.krzaczkowski@yetiforce.com>
 */

namespace App\Integrations\Magento\Synchronizator\Integrators;

/**
 * Magento Order class.
 */
abstract class Order extends \App\Integrations\Magento\Synchronizator\Record
{
	/**
	 * Method to get orders form Magento.
	 *
	 * @param array $ids
	 *
	 * @throws \App\Exceptions\AppException
	 * @throws \ReflectionException
	 *
	 * @return array
	 */
	public function getOrders(array $ids = []): array
	{
		$items = [];
		$data = \App\Json::decode($this->connector->request('GET', $this->config->get('storeCode') . '/V1/orders?' . $this->getSearchCriteria($ids, $this->config->get('orderLimit'))));
		if (!empty($data['items'])) {
			foreach ($data['items'] as $item) {
				$items[$item['entity_id']] = $item;
			}
		}
		return $items;
	}
}